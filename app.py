from flask import Flask, jsonify
import psycopg2

app = Flask(__name__)

# Configure PostgreSQL connection
conn = psycopg2.connect(
    dbname="realty",
    user="michaela",
    host="localhost",
    port="5432"
)

# Define API endpoints

@app.route('/renting')
def get_renting_properties():
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
        return jsonify(properties)
    except Exception as e:
        return jsonify({'error': str(e)}), 500

# Similar endpoints for buying and selling properties

if __name__ == '__main__':
    app.run(debug=True)

