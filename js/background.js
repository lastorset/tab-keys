chrome.commands.onCommand.addListener(function(command) {
	if (command == 'clone-tab') {
        chrome.tabs.query({
            active: true,
            // TODO: Will this work correctly?
            currentWindow: true
        }, function(tabs) {
            console.assert(tabs.length == 1, "Unexpected tab count: "+ tabs.length);

            chrome.tabs.duplicate(tabs[0].id, function (tab) {
                chrome.tabs.update(tab.id, {
                    active: true
                });
            });
        });
	}
});
