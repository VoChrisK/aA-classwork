class View {
  constructor(game, $el) {
    this.game = game;
    this.$el = $el;
    this.setupBoard();
    this.bindEvents();
  }

  bindEvents() {
    $(".board").on("click", ".cell", (e) =>  {
      
      const $target = $(e.target);
      const index = $target.index();
      try {
        this.makeMove($target);
        this.game.playMove(this.getPos(index));

      } catch (err) {
        alert("You made an invalid move!");
      }
      
      this.checkWinner($(e.currentTarget));

    });
  
  }

  checkWinner($currentTarget) {

    if(this.game.isOver()) {

      let gameStatus;
      if(this.game.winner() !== null) {
        
        gameStatus = `You're a winner ${this.game.winner()}!!!`;
        $('.cell').each( (index, ele) => {
 
          if ($(ele).data("mark") === this.game.winner()) {
            $(ele).css({ "background-color": "green", "color": "white" });
          } else {
            $(ele).css({ "background-color": "white", "color": "red" });
          }

        });
        $('body,h1').addClass("cosmic");  
        
      } else {
        gameStatus = `It's a draw!`;
        $('.cell').css({ "background-color": "white", "color": "red" });
        
        $('body,h1').addClass("draw");  
      }

      const $message = $(`<h2>${gameStatus}</h2>`).css({"padding-top": "30px", "font-family": "sans-serif", "text-align": "center"});
      
      $(".ttt").append($message);
    
      $(".board").off();
      $(".board li").off();
    }

  }


  getPos(index) {
    switch(index) {
      case 0: 
        return [0,0];
      case 1:
        return [0,1];
      case 2:
        return [0, 2];
      case 3:
        return [1, 0];
      case 4:
        return [1, 1];
      case 5:
        return [1, 2];
      case 6:
        return [2, 0];
      case 7:
        return [2, 1];
      case 8:
        return [2, 2];
    }
  }


  makeMove($square) {
    console.log(this.game.currentPlayer.toUpperCase());
    this._makeMove($square, this.game.currentPlayer.toUpperCase());
    $square.addClass("checked");
  }

  _makeMove($square, mark) {
    console.log(`${mark} is`);
    $square.data("mark", mark.toLowerCase());
    $square
      .css({"background-color":"white"});
    $square
      .text(mark)
      .css({ "font-size": "60px", "line-height": "80px", "color": "black", "text-align": "center", "padding-top": "5px", "font-family": "sans-serif", "font-weight":"bold"});
  }

  setupBoard() {
    const $list = $("<ul></ul>");
    $list.addClass("board");
    this.$el.append($list);

    for(let i = 0; i < 9; i++) {
      const $listEl = $("<li></li>");
      $listEl.addClass("cell");
      $listEl.css({ "background-color": "gray", "width": "100px", "height": "100px", "list-style": "none", "border": "5px solid black", "box-sizing": "border-box"});
      $list.append($listEl);
    }

    $(".board").css({ "display": "flex", "flex-wrap": "wrap", "width": "300px", "height": "300px", "margin": "auto", "border": "5px solid black", "padding-inline-start": "0px"});
  
      $(".board li").hover(function () {
        if (!$(this).hasClass("checked")) {
          $(this).css("background-color", "yellow");
        } else {
          $(this).css("background-color", "white");
        }

      }, function () {
          if ($(this).hasClass("checked")) {
            $(this).css("background-color", "white");
          } else {
            $(this).css("background-color", "grey");
          }
      });
    
  
  
  }
}

module.exports = View;
