const db = require('../db');

exports.insert = (id_purchase, id_product, purchase_amount, price_total, callback) => {
    db.query(
        'INSERT INTO purchases (id_purchase, id_product, purchase_amount, price_total, purchase_date) VALUES (?, ?, ?, ?, NOW())',
        [id_purchase, id_product, purchase_amount, price_total],
        callback
    );
};

exports.getAllWithProduct = (callback) => {
    db.query(`
        SELECT pc.*, p.name_product 
        FROM purchases pc 
        JOIN products p ON pc.id_product = p.id_product 
        ORDER BY pc.purchase_date DESC
    `, callback);
};

exports.getById = (id_purchase, callback) => {
    db.query('SELECT * FROM purchases WHERE id_purchase = ?', [id_purchase], callback);
};

exports.deleteById = (id_purchase, callback) => {
    db.query('DELETE FROM purchases WHERE id_purchase = ?', [id_purchase], callback);
};
