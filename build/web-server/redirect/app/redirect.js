#!/usr/bin/env node

"use strict";

const DEFAULT_HTTP_PORT = 80;

// import express
const express = require("express");
const    http = require("http");

// setup the app
const app = require("express")();

// bind the server
var httpServer = http.createServer(app);
httpServer.listen(DEFAULT_HTTP_PORT, () => {
    console.log("Redirecting to HTTPS from port " + DEFAULT_HTTP_PORT);
});

// set up a route to redirect http to https
app.get("*", function(request, response){
    response.redirect("https://" + request.headers.host + request.url);
});
