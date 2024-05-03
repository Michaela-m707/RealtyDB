from flask import Flask, render_template, jsonify
import psycopg2

app = Flask(__name__)

# Configure PostgreSQL connection
conn = psycopg2.connect(
    dbname="realty",
    user="michaela",
    password="final07@07",
    host="localhost",
    port="5432"
)

# Define API endpoints

@app.route('/')
def index():
    return render_template('index.html')
    '''
    try:
        # Execute a query to fetch data from the database
        cur = conn.cursor()
        cur.execute("SELECT * FROM properties LIMIT 1")
        data = cur.fetchone()
        cur.close()
        
        # If data is fetched successfully, the connection is working
        return 'Database connection is working!'
    except Exception as e:
        # If there's an error, print it to the console for debugging
        print('Error:', e)
        return 'Database connection error'
'''
@app.route('/renting')
def renting():
    try:
        cur = conn.cursor()
        cur.execute("""
            SELECT p.*, r.rental_price, r.available_date
            FROM properties p
            JOIN renting r ON p.id = r.property_id
            WHERE p.category = 'renting'
        """)
        properties = cur.fetchall()
        cur.close()
        return render_template('renting.html', properties=properties)
    except Exception as e:
        return jsonify({'error': str(e)}), 500

@app.route('/buying')
def buying():
    try:
        cur = conn.cursor()
        cur.execute("""
            SELECT p.*, b.list_price, b.status
            FROM properties p
            JOIN buying b ON p.id = b.property_id
            WHERE p.category = 'buying'
        """)
        properties = cur.fetchall()
        cur.close()
        return render_template('buying.html', properties=properties)
    except Exception as e:
        return jsonify({'error': str(e)}), 500


if __name__ == '__main__':
    app.run(debug=True)
