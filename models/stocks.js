const db = require('../db');

exports.kurangiStok = (id_product, jumlah, callback) => {
    db.query(
        'UPDATE stock_products SET stock_amount = stock_amount - ?, date_update = NOW() WHERE id_product = ?',
        [jumlah, id_product],
        callback
    );
};

exports.tambahStok = (id_product, jumlah, callback) => {
    db.query(
        'UPDATE stock_products SET stock_amount = stock_amount + ?, date_update = NOW() WHERE id_product = ?',
        [jumlah, id_product],
        callback
    );
};
