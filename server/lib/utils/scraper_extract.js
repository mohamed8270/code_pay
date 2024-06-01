// '#jobHighlight div:eq(6) span', '#jobHighlight div:eq(7) span',
// Get job posted day
const extractPostData = ($) => {
    if (!$) return;

    const selectors = ['months ago', 'days ago', 'a month ago'];
    const checks = ['#jobHighlight div:eq(8) span', '#jobHighlight div:eq(9) span', '#jobHighlight div:eq(10) span'];
    const checks2 = ['#jobHighlight div:eq(6) span', '#jobHighlight div:eq(7) span'];

    for (const selector of selectors) {
        for (const check of checks) {
            for (const check2 of checks2) {
                const element = $(check).map((index, e) => $(e).text().trim()).get().join(", ");
                const element2 = $(check2).map((index, e) => $(e).text().trim()).get().join(", ");
                if (element.includes(selector)) {
                    return element;
                } else if (element == selector) {
                    return selector;
                } else if (element2.includes(selector)) {
                    return element2;
                } 
            }
        }
    }

    return '';
} 

// Get job views 
const extractViewsData = ($) => {
    if (!$) return;

    const selectors = ['Viewed', 'View', 'views'];
    const checks = ['#jobHighlight div:eq(8) span', '#jobHighlight div:eq(9) span', '#jobHighlight div:eq(10) span', '#jobHighlight div:eq(7) span'];

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
    const checks = ['#jobHighlight div:eq(8) span', '#jobHighlight div:eq(9) span', '#jobHighlight div:eq(10) span'];

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

// extract job id
const extractJobID = (data) => {

    let output = '';
    const res = data.replace(/\D/g,'');
    for (let i=0; i < res.length; i++) {
        output = res;
    }
    
    return `https://www.foundit.in/seeker/job-apply?id=${output}8&autoApply=true` || '';
}

// extract URL index
const extractJobIndexData = ($, i) => {
    const jobIndex = $('a').map((i, el) => $(el).attr('href')).get();
    // console.log(jobIndex);
    const output = jobIndex[i];

    return output;
}


module.exports = {
    extractPostData, 
    extractViewsData,
    extractAppliedData,
    extractJobID,
    extractJobIndexData
}