var zombie = require('/usr/lib/node_modules/zombie');
function World() {
      this.browser = new zombie(); // this.browser will be available in step definitions

        this.visit = function (url, callback) {
                this.browser.visit(url, callback);
                  };
}

module.exports = function() {
      this.World = World;
};
