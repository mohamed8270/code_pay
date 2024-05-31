


// function to remove space and \n
const extractJobDataSpace = (data) => {
    if(!data) return;

    const res = data.text().trim();
    // const output = res.replace(/[\r\n]+/gm, "").replace(/\s+/g, ' ');
    const output = res.replace(/[\r\n]+/gm, "") .replace(/\s+/g, " ").replace(/<(?:.|\n)*?>/g, ", ");
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

// separate each tag with comma
const extractCommaSeparated = ($,data) => {
    if(!$) return;

    const output = $(data).map((index, element) => $(element).text().trim()).get().join(", ");
    return output.match(/\b\w+\b/g);
} 

// Get job posted day
const extractPostData = ($) => {
    if (!$) return;

    const selectors = ['months ago', 'days ago', 'a month ago'];
    const checks = ['#jobHighlight div:eq(6) span', '#jobHighlight div:eq(7) span', '#jobHighlight div:eq(8) span', '#jobHighlight div:eq(9) span', '#jobHighlight div:eq(10) span'];

    for (const selector of selectors) {
        for (const check of checks) {
            const element = $(check).map((index, e) => $(e).text().trim()).get().join(", ");
            if (element.includes(selector)) {
                return element;
            } else if (element == selector) {
                return selector;
            }
        }
    }

    return '';
} 

// Get job views 
const extractViewsData = ($) => {
    if (!$) return;

    const selectors = ['Viewed', 'View', 'views'];
    const checks = ['#jobHighlight div:eq(6) span', '#jobHighlight div:eq(7) span', '#jobHighlight div:eq(8) span', '#jobHighlight div:eq(9) span', '#jobHighlight div:eq(10) span'];

    for (const selector of selectors) {
        for (const check of checks) {
            const element = $(check).map((index, e) => $(e).text().trim()).get().join(", ");
            if (element.includes(selector)) {
                return element;
            }
        }
    }

    return '';
}

// Get job views 
const extractAppliedData = ($) => {
    if (!$) return;

    const selectors = ['Applied', ' Applied'];
    const checks = ['#jobHighlight div:eq(6) span', '#jobHighlight div:eq(7) span', '#jobHighlight div:eq(8) span', '#jobHighlight div:eq(9) span', '#jobHighlight div:eq(10) span'];

    for (const selector of selectors) {
        for (const check of checks) {
            const element = $(check).map((index, e) => $(e).text().trim()).get().join(", ");
            if (element.includes(selector)) {
                return element;
            }
        }
    }

    return '';
}

module.exports = {
    extractJobDataSpace, 
    extractJobDataComma, 
    extractCommaSeparated, 
    extractPostData, 
    extractViewsData,
    extractAppliedData
};