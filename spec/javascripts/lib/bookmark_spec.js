describe('Bookmark', function(){
 describe('confirm', function() {
   beforeEach(function() {
     jasmine.Ajax.install();
     spyOn(GiftHorse,'title').and.returnValue('expectedTitle');
     spyOn(GiftHorse,'location').and.returnValue('expectedURL');
   });

   afterEach(function() {
     jasmine.Ajax.uninstall();
   });

   it('shows a confirm dialog with the title and location url', function() {
     spyOn(window, 'confirm');

     Bookmark.confirm();

     expect(window.confirm).toHaveBeenCalledWith('This page is : expectedTitle\nThe URL is : expectedURL');

   });

   it('does not post an ajax request if not confirmed', function() {
     spyOn(window, 'confirm').and.returnValue(false);

     Bookmark.confirm();

     expect(jasmine.Ajax.requests.count()).toEqual(0);
   });

   it('posts an ajax request to create a bookmark', function() {

     spyOn(window, 'confirm').and.returnValue(true);

     Bookmark.confirm();

     var mostRecent = jasmine.Ajax.requests.mostRecent();
     expect(mostRecent.url).toEqual('http://localhost:3000/bookmarks');
     expect(mostRecent.params).toEqual('bookmark%5Btitle%5D=expectedTitle&bookmark%5Burl%5D=expectedURL');
   });
 });
});