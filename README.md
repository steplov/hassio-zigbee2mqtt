<div align="center">
<img src="images/logo.png">
<h1>Zigbee2mqtt Hass.io Add-on</h1>
<div style="display: flex; justify-content: center;">
  <a style="margin-right: 0.5rem;" href="https://travis-ci.org/danielwelch/hassio-zigbee2mqtt">
    <img src="https://img.shields.io/travis/danielwelch/hassio-zigbee2mqtt.svg?style=flat-square&logo=travis">
  </a>
  <a style="margin-left: 0.5rem;" href="https://cloud.docker.com/u/dwelch2101/repository/docker/dwelch2101/zigbee2mqtt-armhf">
    <img src="https://img.shields.io/docker/pulls/dwelch2101/zigbee2mqtt-armhf.svg?style=flat-square&logo=docker">
  </a>
</div>
<br>
<p>Run Zigbee2mqtt as a Hass.io Add-on</p>
</div>

## Do not use this add-on
Seriously, do not use this addon. Probably you're looking for official add-on
[danielwelch/hassio-zigbee2mqtt](https://github.com/danielwelch/hassio-zigbee2mqtt)

## Reasons to fork

#### First and main
With an existing setup add-on couldn't detect devices and restore their state.
I extended config to be able to do it

#### Second 
I'd like to keep my homeassistant setup as simple as possible and don't need extra features. So, it is open source and i fork it

## Credits
- [danielwelch](https://github.com/danielwelch)
- [ciotlosm](https://github.com/ciotlosm)
- [Koenkk](https://github.com/Koenkk) for [zigbee2mqtt](https://github.com/Koenkk/zigbee2mqtt)
