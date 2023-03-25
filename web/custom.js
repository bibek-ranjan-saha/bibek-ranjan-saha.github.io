function showAlert(msg)
{
alert(`got some error in flutter 😥 ${msg}`)
}

function getData()
{
require(['os'], function (foo) {
    alert(`data is here $os`)
});
}