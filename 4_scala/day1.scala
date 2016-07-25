import scala.collection.mutable

class Game(board: List[String]) {

  println("Checking game: ")
  println(board(0))
  println(board(1))
  println(board(2))

  var lanes = board :::
  //add columns
  List(board.lift(0).get.split("").lift(0).get + board.lift(1).get.split("").lift(0).get + board.lift(2).get.split("").lift(0).get,
    board.lift(0).get.split("").lift(1).get + board.lift(1).get.split("").lift(1).get + board.lift(2).get.split("").lift(1).get,
    board.lift(0).get.split("").lift(2).get + board.lift(1).get.split("").lift(2).get + board.lift(2).get.split("").lift(2).get) :::
  //add diagonals
    List(board(0).split("")(0) + board(1).split("")(1) + board(2).split("")(2), board(0).split("")(2) + board(1).split("")(1) + board(2).split("")(0))

  def laneComplete(value: String, isComplete: Boolean): Boolean = {
    var occur = value.groupBy(_.toChar)
    if (occur.size == 1 && !occur.keys.head.charValue().equals(" ".charAt(0).charValue())) {
      return true
    }
    false
  }

  def hasWinner(): Unit = {
    var hasWinner = false
    var isComplete = false

    for (i<- 0 until lanes.length) {
      hasWinner |= laneComplete(lanes(i), hasWinner)
      if (hasWinner) {
        println("The Winner is '" + lanes(i).charAt(0) + "'")
        return
      }
    }

    if (lanes(0).contains(" ") || lanes(1).contains(" ") || lanes(2).contains(" ")) {
      println("The game is incomplete")
    } else {
      println("the game is complete")
    }
  }
}

object GameApp {
  def main(args: Array[String]): Unit = {
    val game = new Game(List("XOO","XXX", "XOO"))
    game.hasWinner()
  }
}