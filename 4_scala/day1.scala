import scala.collection.mutable

class Game(board: List[String]) {
  println("creating new game: ")

  var lanes = board :::
  //add columns
  List(board.lift(0).get.split("").lift(0).get + board.lift(1).get.split("").lift(0).get + board.lift(2).get.split("").lift(0).get,
    board.lift(0).get.split("").lift(1).get + board.lift(1).get.split("").lift(1).get + board.lift(2).get.split("").lift(1).get,
    board.lift(0).get.split("").lift(2).get + board.lift(1).get.split("").lift(2).get + board.lift(2).get.split("").lift(2).get) :::
  //add diagonals
    List(board(0).split("")(0) + board(1).split("")(1) + board(2).split("")(2), board(0).split("")(2) + board(1).split("")(1) + board(2).split("")(0))

  def hasWinner(): Unit = {

  }
}

object GameApp {
  def main(args: Array[String]): Unit = {
    val game = new Game(List("XOX"," O ", " OX"))
  }
}