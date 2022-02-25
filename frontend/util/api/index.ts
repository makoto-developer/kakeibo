import axios from "axios";

const ApiClient= axios.create({
    baseURL: "http://localhost:4000/",
    responseType: "json",
    headers: {
        "Content-Type": "application/json",
    },
});

export default ApiClient
