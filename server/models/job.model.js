const mongoose = require('mongoose');

const jobSchema = new mongoose.Schema({
    url: {type: String, required: true, unique: true},
    jobName: {type: String, required: true},
    jobCompany: {type: String, required: true},
    jobPlace: {type: String, required: true},
    jobExperience: {type: String, required: true},
    jobPosted: {type: String, required: true},
    // jobViews: {type: String, required: true},
    jobApplied: {type: String, required: true},
    jobDescription: {type: String, required: true},
    jobType: {type: String, required: true},
    jobIndustry: {type: String, required: true},
    jobFunction: {type: String, required: true},
    jobSkillsets: {type: String, required: true},
    jobCompanyUrl: {type: String, required: true},
    jobSource: {type: String, required: true},
    // jobApply: {type: String, required: true},
});