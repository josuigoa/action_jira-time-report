# Action for [ideckia](https://ideckia.github.io/): jira-time-report

## Description

Open the Time Sheet Report from Jira between startDate and endDate selected from a dialog

## Properties

| Name | Type | Description | Shared | Default | Possible values |
| ----- |----- | ----- | ----- | ----- | ----- |
| browser | String | The browser to use to open the url | false | null | null |
| urlPattern | String | Time sheet report url pattern (::startDate:: and ::endDate:: will be replaced with selected dates) | false | null | null |


## Test the action

There is a script called `test_action.js` to test the new action. Set the `props` variable in the script with the properties you want and run this command:

```
node test_action.js
```

## Example in layout file

```json
{
    "text": "jiratimereport example",
    "bgColor": "00ff00",
        "actions": [{
                "name": "jira-time-report",
                "props": {
                    "browser": "firefox",
                    "urlPattern": "local.jira/xxxxxxx&startDate=::startDate::&endDate=::endDate::&xxxxx"
                }
            }
    ]
}
```
