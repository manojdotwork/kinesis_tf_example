'use strict';
console.log('Loading function');

/* Stock Ticker format parser */
const parser = /^\{\"ticker_symbol\"\:\"[A-Z]+\"\,\"SECTOR\"\:"[A-Z]+\"\,\"change\"\:[-.0-9]+\,\"price\"\:[-.0-9]+\}/i;
//"ticker_symbol":"NGC","sector":"HEALTHCARE","change":-0.08,"price":4.73


exports.handler = (event, context, callback) => {
    let success = 0; // Number of valid entries found
    let failure = 0; // Number of invalid entries found
    let dropped = 0; // Number of dropped entries 

    /* Process the list of records and transform them */
    const output = event.records.map((record) => {
        let inbuff = new Buffer(record.data, 'base64');  
        let text = inbuff.toString('ascii');
        text=text+" data got transformed";
        
        let outbuff = new Buffer(text);  
        let base64data = outbuff.toString('base64');
        return {
            recordId: record.recordId,
            result: 'Ok',
            data: base64data
        };
    });
    console.log(`Processing completed.  Successful records ${output.length}.`);
    callback(null, { records: output });
};