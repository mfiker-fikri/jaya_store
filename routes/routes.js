const express = require('express');
const router = express.Router();
const db = require('../db');
const adminController = require('../controllers/adminController');

// Tampilkan dashboard
router.get('/', adminController.getDashboard);

// Proses pembelian
router.post('/beli', adminController.postPurchase);

// Cancel pembelian
router.get('/pembelian', adminController.getPurchases);

// Lihat data pembelian
router.post('/cancel/:id', adminController.cancelPurchase);

module.exports = router;
