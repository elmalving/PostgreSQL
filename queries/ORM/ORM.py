from flask import Flask
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy import Column, Integer, String, Date, Numeric

app = Flask(__name__)
app.config['SQLALCHEMY_DATABASE_URI'] = 'postgresql://postgres:egorka98@localhost/RDBS'

db = SQLAlchemy(app)


class Student(db.Model):
    __tablename__ = 'student'

    id_student = Column(Integer, primary_key=True, autoincrement=True)
    id_adresa = Column(Integer, nullable=False)
    id_kurator = Column(Integer, nullable=False)
    id_skupina = Column(Integer)
    datum_narozeni = Column(Date, nullable=False)
    jazyk = Column(String(30), nullable=False)
    jmeno = Column(String(70), nullable=False)
    prijmeni = Column(String(70), nullable=False)
    telefonni_cislo = Column(String(20), nullable=False)
    discount = Column(Numeric, default=0)
    balance = Column(Numeric, default=0)


def print_all_students():
    with app.app_context():
        all_students = Student.query.all()

        print("All Students:")
        for student in all_students:
            print(f"ID: {student.id_student}")
            print(f"Name: {student.jmeno} {student.prijmeni}")
            print(f"Date of Birth: {student.datum_narozeni}")
            print(f"Language: {student.jazyk}")
            print(f"Phone Number: {student.telefonni_cislo}")
            print(f"Discount: {student.discount}")
            print(f"Balance: {student.balance}")
            print("------------------")


if __name__ == '__main__':
    with app.app_context():
        db.create_all()
    print_all_students()
