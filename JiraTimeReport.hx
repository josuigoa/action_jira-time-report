package;

using api.IdeckiaApi;
using StringTools;

typedef Props = {
	@:editable("The browser to use to open the url")
	var browser:String;
	@:editable("Time sheet report url pattern (::startDate:: and ::endDate:: will be replaced with selected dates)")
	var urlPattern:String;
}

@:name("jira-time-report")
@:description("Open the Time Sheet Report from Jira between startDate and endDate selected from a dialog")
class JiraTimeReport extends IdeckiaAction {
	override public function init(initialState:ItemState):js.lib.Promise<ItemState>
		return super.init(initialState);

	public function execute(currentState:ItemState):js.lib.Promise<ItemState> {
		server.dialog.calendar('Select date', 'Select start date', null, null, null, '%Y-%m-%d').then(startDate -> {
			server.dialog.calendar('Select date', 'Select end date', null, null, null, '%Y-%m-%d').then(endDate -> {
				var url = props.urlPattern.replace('::startDate::', startDate);
				url = url.replace('::endDate::', endDate);
				var cmd = '${props.browser} --new-tab "$url"';
				Sys.command(cmd);
			});
		});

		return js.lib.Promise.resolve(currentState);
	}

	override public function onLongPress(currentState:ItemState):js.lib.Promise<ItemState>
		return super.onLongPress(currentState);
}
