class Game(board: List[String]) {
  println("hello")
  val rows = board
}

object GameApp {
  def main(args: Array[String]): Unit = {
    println("test")
    val game = new Game(List("XOX"," O ", " OX"))
    println(game)
  }
}