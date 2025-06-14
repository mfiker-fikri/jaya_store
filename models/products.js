const db = require('../db');

exports.getAllWithStock = (callback) => {
    const sql = `
        SELECT p.*, s.stock_amount AS stock 
        FROM products p 
        JOIN stock_products s ON p.id_product = s.id_product
    `;
    db.query(sql, callback);
};

exports.getById = (id_product, callback) => {
    db.query('SELECT * FROM products WHERE id_product = ?', [id_product], callback);
};
