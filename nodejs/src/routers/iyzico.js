

const router = require('express').Router();


const iyzicoController = require("../controllers/iyzico")


router.post("/pay", iyzicoController.pay);
router.post("/payFinish", iyzicoController.payFinish);

module.exports = router;