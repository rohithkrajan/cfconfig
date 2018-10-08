component extends = 'testbox.system.BaseSpec' { 


  function beforeAll() {    
    var configuration = new config.Settings();    
  }

  function run() {
    describe('Settings', function () {
      afterEach(function () {
        
      });

      it('returns deault section settings from ini', function () {
        var config = new config.Settings(); 
        var result =  config.getValue('devmode'); 	
        expect(result).toBe('local');
      });     
       it('returns section sepcfic settings from ini', function () {
        var config = new config.Settings(); 
        var result =  config.getValue('passwordFromEmail','clientportal'); 	
        expect(result).toBe('rohith@test.com');
      });   
    });
  }
}
