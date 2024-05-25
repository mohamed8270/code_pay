


// function to remove space and \n
const extractJobDataSpace = (data) => {
    if(!data) return;

    const res = data.text().trim();
    const output = res.replace(/[\r\n]+/gm, "").replace(/\s+/g, ' ');
    return output;
};

// function to remove space and replace with ','
const extractJobDataComma = (data) => {
    if(!data) return;

    const res = data.text().trim();
    const lines = res.split(/\n/);
    const output = lines.map(line => line.trim()).filter(line => line.length > 0).join(', ');
    return output;
};

module.exports = {extractJobDataSpace, extractJobDataComma};