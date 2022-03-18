from types import NoneType
from flask import Flask, render_template, redirect, request, make_response
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.ext.automap import automap_base
from flask_bcrypt import Bcrypt
from random import randrange


app = Flask(__name__)
bcrypt = Bcrypt(app)
app.config.from_object("config.DBConfig")

app.config['SQLALCHEMY_DATABASE_URI'] = f'mysql+pymysql://{app.config["DB_USERNAME"]}:{app.config["DB_PASSWORD"]}@{app.config["DB_HOST"]}/{app.config["DB_NAME"]}'
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
    foodMenu = foodMenu[::-2]
    pages = db.session.query(Page).order_by(Page.order.asc()).all()
    db.session.close()
    return render_template('index.html', pages=pages, foodMenu=foodMenu)


@ app.route('/login', methods=["GET", "POST"])
def login():

    # check cookie existantce,
    if 'user' in request.cookies and 'cookieHash' in request.cookies:
        loginUser = request.cookies.get('user')
        user = db.session.query(User).filter_by(username=loginUser).first()
        storedCookieHash = request.cookies.get('cookieHash')

        if storedCookieHash == user.cookieHash:
            return redirect("/addmenuitem")

    elif request.method == "POST":
        username = request.form["username"].lower().strip()
        pwd = request.form["password"]
        user = db.session.query(User).filter_by(username=username).first()

        # check user existance
        if type(user) is NoneType:
            return render_template('error.html', message="the user does not exist", back=request.referrer)

        elif (bcrypt.check_password_hash(user.passHash, pwd)):
            # generate cookiehash when user login
            cookieHash = bcrypt.generate_password_hash(
                str(randrange(9999999999))).decode('utf-8')
            user.cookieHash = cookieHash
            db.session.commit()
            db.session.close()
            resp = make_response(redirect("/addmenuitem"))
            resp.set_cookie('user', username, max_age=60*60*24)
            resp.set_cookie('cookieHash', cookieHash,  max_age=60*60*24)
            return resp
        else:
            return render_template('error.html', message="wrong password", back=request.referrer)
    else:
        return render_template('login.html')


@ app.route('/addmenuitem', methods=["GET", "POST"])
def addMenuItem():

    # check cookie existantce
    if 'user' in request.cookies and 'cookieHash' in request.cookies:
        loginUser = request.cookies.get('user')
        user = db.session.query(User).filter_by(username=loginUser).first()
        storedCookieHash = request.cookies.get('cookieHash')

        if storedCookieHash == user.cookieHash:
            if request.method == "POST":
                items = request.form.getlist('item')
                entrees = request.form.getlist('entree')
                dates = request.form.getlist('date')

                for i in range(len(items)):
                    if(items[i] != ""  and entrees[i] !="" and dates[i] != ""):
                        new_item = FoodMenu(item=items[i], entree=entrees[i], day=dates[i])
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
        
@ app.route('/logout')
def logout():
    resp = make_response(redirect("/"))
    resp.set_cookie('user', max_age=0)
    resp.set_cookie('cookieHash', max_age=0)
    return resp


if __name__ == '__main__':
    app.run(debug=True)
