function showAlert(msg) {
    alert(msg)
}

function getBatteryDataInternal() {
 navigator.getBattery()
    .then(battery => {
      let navigatorData = {
        charging: battery.charging,
        chargingTime: battery.chargingTime,
        dischargingTime: battery.dischargingTime,
        level: battery.level,
        status: true
      };
        const testDiv = document.createElement("div");
        testDiv.setAttribute("id", "test");
        testDiv.style.display = 'none';
        testDiv.textContent = `${JSON.stringify(navigatorData)}`;
        document.body.appendChild(testDiv);
    })
    .catch(() => {
      let navigatorData = {
        status: false
      };
    const testDiv = document.createElement("div");
    testDiv.setAttribute("id", "test");
    testDiv.style.display = 'none';
    testDiv.textContent = `${JSON.stringify(navigatorData)}`;
    document.body.appendChild(testDiv);
    });
}

function returnBackBatteryData(){
    const myDiv = document.getElementById("test");
    const divText = myDiv.textContent;
    myDiv.remove();
    return divText;
}


function getUserAgent() {
    return navigator.userAgent;
}

function getBatteryData() {
    getBatteryData().then(data => {
    return data;
  });
}

async function getBatteryDataInJSON() {
  try {
    const battery = await navigator.getBattery();
    const navigatorData = {
      charging: battery.charging,
      chargingTime: battery.chargingTime,
      dischargingTime: battery.dischargingTime,
      level: battery.level,
      status: true,
    };
    return JSON.stringify(navigatorData);
  } catch (error) {
    const navigatorData = {
      status: false,
      error: error.message || 'Unknown error',
    };
    return JSON.stringify(navigatorData);
  }
}