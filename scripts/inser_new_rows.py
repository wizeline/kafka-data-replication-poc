import os
import sys
import uuid
from datetime import datetime

import pandas as pd
from sqlalchemy import Column, Integer, create_engine
from sqlalchemy.ext.declarative import declarative_base
from sqlalchemy.orm import Session, sessionmaker
from sqlalchemy.sql import func
from sqlalchemy.types import DateTime, String

# example usage:
#    PSQL_URL=$PSQL_1 python scripts/inser_new_rows.py 5

engine = create_engine(os.environ["PSQL_URL"])
SessionLocal = sessionmaker(autocommit=False, autoflush=False, bind=engine)
Base = declarative_base()


def save_to_db(db: Session, new_record):
    db.add(new_record)
    db.commit()
    db.refresh(new_record)
    return new_record


class TableA(Base):
    __tablename__ = "table_a"
    id = Column(Integer, primary_key=True, nullable=False)
    column_a = Column(String, nullable=False)
    column_b = Column(String, nullable=False)
    created_on = Column(
        DateTime(timezone=True),
        server_default=func.now(),
        comment="When the record was inserted in the table.",
    )


def get_random_str():
    return str(uuid.uuid4())


def get_numbre_of_records():
    if len(sys.argv) > 1:
        return int(sys.argv[1])
    return 1


def main():
    numbre_of_records = get_numbre_of_records()
    for i in range(numbre_of_records):
        result = save_to_db(
            SessionLocal(),
            TableA(
                column_a=get_random_str(),
                column_b=get_random_str(),
                created_on=datetime.utcnow(),
            ),
        )
        print(vars(result))

    result = pd.read_sql_query("SELECT * from table_a", engine)
    print(result)


if __name__ == "__main__":
    main()
