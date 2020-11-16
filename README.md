# Improved Conky Flair Widget


This project provides an up to date and improved version of the [Conky Flair Widget](https://www.deviantart.com/speedracker/art/Flair-Weather-Conky-Made-for-Conky-Manager-510130311) initially pushed on [DeviantArt](https://www.deviantart.com/) by [Jesse Avalos](https://www.deviantart.com/speedracker).

The Improved Conky Flair Widget brings the following improvements.

* Replace the retired Yahoo Weather API by OpenWeatherMap;
* Update the Conky configuration files to use the last format;
* Remove unused files and reorganize files to be more logical.

## Screenshots

### Style 1

![Style 1](/style-1.jpg "Style 1")

### Style 2

![Style 2](/style-2.jpg "Style 2")

## Setup

The Widget requires [jq](https://stedolan.github.io/jq/) and an OpenWeatherMap API key.

### Install `jq`

Follow the instructions on the [Download jq](https://stedolan.github.io/jq/download/) page.

### Get an OpenWeatherMap API key

1. Go to the [Create New Account](https://home.openweathermap.org/users/sign_up) form and create your account;
2. Confirm your email address through the received email;
3. Get the API key you received by email (**WARNING**: activation of your API key could take several hours).

### Configure your API key

Create a `~/.config/conky/flair-weather.json` file with the following content and reload your Widget.

```json
{
    "openweathermap": {
        "appid": "{API_KEY}"
    }
}
```
