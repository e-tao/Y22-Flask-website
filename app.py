from flask import Flask, render_template, redirect, request
from flask_sqlalchemy import SQLAlchemy
from sqlalchemy.ext.automap import automap_base

app = Flask(__name__)

# replace the user name and password in the statement below
app.config['SQLALCHEMY_DATABASE_URI'] = 'mysql+pymysql://root:''@localhost/bluescafe'
app.config['SQLALCHEMY_TRACK_MODIFICATIONS'] = False

db = SQLAlchemy(app)

# page = db.Table('page', db.metadata, autoload=True, autoload_with=db.engine)

Base = automap_base()
Base.prepare(db.engine, reflect=True)
Page = Base.classes.page
Menu = Base.classes.menu


@ app.route('/')
@ app.route('/index')
def index():
    # new_page = Page(title="NewPage", name="new", content="this is the new page")
    # db.session.add(new_page)
    # db.session.commit()
    foodMenu = db.session.query(Menu)
    menus = db.session.query(Page.name).order_by(Page.order.asc())
    pages = db.session.query(Page.content).order_by(Page.order.asc())
    return render_template('index.html', pages=pages, menus=menus, foodMenu=foodMenu)


if __name__ == '__main__':
    app.run(debug=True)
