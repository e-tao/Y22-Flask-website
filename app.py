from flask import Flask, render_template, redirect, request, make_response
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.ext.automap import automap_base
from flask_bcrypt import Bcrypt
from random import randrange


app = Flask(__name__)
bcrypt = Bcrypt(app)

# replace the user name and password in the statement below
# app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://username:password@localhost/bluescafe'
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://ethan:w8Q1Ji8I23s2r4YIsocemabAb5nEQo@192.168.1.15/bluescafe'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)

Base = automap_base()
Base.prepare(db.engine, reflect=True)
Page = Base.classes.page
FoodMenu = Base.classes.menu
User = Base.classes.user


@ app.route('/')
@ app.route('/index')
def index():
    foodMenu = db.session.query(FoodMenu).order_by(
        FoodMenu.day.desc()).limit(6)
    foodMenu = foodMenu[::-1]
    pages = db.session.query(Page).order_by(Page.order.asc()).all()
    db.session.close()
    return render_template('index.html', pages=pages, foodMenu=foodMenu)


@ app.route('/login', methods=["GET", "POST"])
def login():
    if request.method == "POST":
        username = request.form["username"].lower().strip()
        pwd = request.form["password"]

        user = db.session.query(User).filter_by(username=username).first()

        if (bcrypt.check_password_hash(user.passHash, pwd)):
            cookieHash = bcrypt.generate_password_hash(
                str(randrange(999999999))).decode('utf-8')
            user.cookieHash = cookieHash
            db.session.commit()
            db.session.close()
            resp = make_response(redirect("/addmenuitem"))
            resp.set_cookie('user', username, max_age=60*60*24)
            resp.set_cookie('cookieHash', cookieHash,  max_age=60*60*24)
            return resp
        else:
            return render_template('error.html', message="wrong password")
    else:
        return render_template('login.html')


@ app.route('/addmenuitem', methods=["GET", "POST"])
def addMenuItem():
    if request.cookies.get('user'):
        if request.method == "POST":
            items = request.form.getlist('item')
            dates = request.form.getlist('date')

            for i in range(len(items)):
                if(items[i] != "" and dates[i] != ""):
                    new_item = FoodMenu(item=items[i], day=dates[i])
                    db.session.add(new_item)
                else:
                    return render_template('error.html', message="input error", back=request.referrer)

            db.session.commit()
            db.session.close()
            return redirect("/")
        else:
            return render_template("addmenuitem.html")
    else:
        return redirect("/login")


if __name__ == '__main__':
    app.run(debug=True)
