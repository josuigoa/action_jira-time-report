package;

using api.IdeckiaApi;
using StringTools;

typedef Props = {
	@:editable("The browser to use to open the url")
	var browser:String;
	@:editable("Time sheet report url pattern (::startDate:: and ::endDate:: will be replaced with selected dates)")
	var url_pattern:String;
}

@:name("jira-time-report")
@:description("Open the Time Sheet Report from Jira between startDate and endDate selected from a dialog")
class JiraTimeReport extends IdeckiaAction {
	override public function init(initialState:ItemState):js.lib.Promise<ItemState>
		return super.init(initialState);

	public function execute(currentState:ItemState):js.lib.Promise<ItemState> {
		server.dialog.custom(haxe.io.Path.join([js.Node.__dirname, 'calendar_begin_end.json'])).then(response -> {
			switch response {
				case Some(values):
					var startDate = '';
					var endDate = '';
					for (p in values) {
						if (p.id == 'start')
							startDate = p.value;
						if (p.id == 'end')
							endDate = p.value;
					}
					var url = props.url_pattern.replace('::startDate::', startDate);
					url = url.replace('::endDate::', endDate);
					var cmd = '${props.browser} --new-tab "$url"';
					Sys.command(cmd);
				case None:
			}
		});

		return js.lib.Promise.resolve(currentState);
	}

	override public function onLongPress(currentState:ItemState):js.lib.Promise<ItemState>
		return super.onLongPress(currentState);
}
