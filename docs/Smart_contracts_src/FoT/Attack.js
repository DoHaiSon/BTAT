const {RNG_between} = require('../../Scripts/Utils/Common')
const {RNG_acc, Select_acc} = require('../../Scripts/Utils/RNG_acc')
const {send_tx} = require('../../Scripts/Utils/Send_tx')

async function Tx () {
	const account_1 = RNG_acc();
	// console.log(account_1);

	const account_2 = RNG_acc();
	// console.log(account_2);

	send_tx('tx', account_1, null, null, '', account_2, RNG_between(1, 1e4))
}

setInterval(async () => {
	Tx();
}, 200);