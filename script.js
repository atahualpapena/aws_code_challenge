fetch("https://g75ccxjvcb.execute-api.us-west-2.amazonaws.com/dev/request", {
    method: "POST",
    headers: {
        'Accept': 'application/json',
        'Content-Type': 'application/json'
    },
    body: JSON.stringify({
        username: myUsername,
        password: myPassword
    })
})
    .then((response) => {
        console.log(response)
    });