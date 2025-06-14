const Product = require('../models/products');
const Stock = require('../models/stocks');
const Purchase = require('../models/purchases');
const { v4: uuidv4 } = require('uuid');


exports.getDashboard = (req, res) => {
    Product.getAllWithStock((err, products) => {
        if (err) throw err;
        res.render('template', 
            { 
                title: 'Dashboard Produk',
                body: 'pages/index',
                products, 
            });
    });
};

exports.postPurchase = (req, res) => {
    const { id_product, purchase_amount } = req.body;

    Product.getById(id_product, (err, result) => {
        if (err) throw err;

        if (!result || result.length === 0) {
            return res.status(404).send('Produk tidak ditemukan');
        }

        const product = result[0];
        const price_total = product.price * purchase_amount;
        const id_purchase = uuidv4();

        Purchase.insert(
            id_purchase,
            id_product, 
            purchase_amount, 
            price_total, 
            (err2) => {
                if (err2) throw err2;

                Stock.kurangiStok(id_product, purchase_amount, (err3) => {
                    if (err3) throw err3;
                    res.redirect('/');
            });
        });
    });
};

exports.getPurchases = (req, res) => {
    Purchase.getAllWithProduct((err, purchases) => {
        if (err) throw err;
        res.render('template', 
            { 
                title: 'Riwayat Pembelian',
                body: 'pages/purchase',
                purchases,
            });
    });
};

exports.cancelPurchase = (req, res) => {
    const id_purchase = req.params.id;

    Purchase.getById(id_purchase, (err, result) => {
        if (err) throw err;
        if (!result || result.length === 0) return res.redirect('/pembelian');

        const purchase = result[0];
        const { id_product, purchase_amount } = purchase;

        Purchase.deleteById(id_purchase, (err2) => {
            if (err2) throw err2;

            Stock.tambahStok(id_product, purchase_amount, (err3) => {
                if (err3) throw err3;
                res.redirect('/pembelian');
            });
        });
    });
};
