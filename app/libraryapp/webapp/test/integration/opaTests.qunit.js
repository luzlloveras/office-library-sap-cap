sap.ui.require(
    [
        'sap/fe/test/JourneyRunner',
        'libraryapp/test/integration/FirstJourney',
		'libraryapp/test/integration/pages/BooksList',
		'libraryapp/test/integration/pages/BooksObjectPage'
    ],
    function(JourneyRunner, opaJourney, BooksList, BooksObjectPage) {
        'use strict';
        var JourneyRunner = new JourneyRunner({
            launchUrl: sap.ui.require.toUrl('libraryapp') + '/index.html'
        });

       
        JourneyRunner.run(
            {
                pages: { 
					onTheBooksList: BooksList,
					onTheBooksObjectPage: BooksObjectPage
                }
            },
            opaJourney.run
        );
    }
);