import scala.collection.mutable
import scala.io.Source

trait Censor {
  def censor(text: String, wordMap: scala.collection.mutable.Map[String,String]): String = {
    wordMap.foldLeft(text) {(text, pair) => text.replaceAll(pair._1, pair._2)}
  }
}

class Polite extends Censor

object Day2 {
  def main(args: Array[String]): Unit = {
    //use foldLeft to count size of list of strings
    println(List("a", "b", "c").foldLeft(0) {(n, word) => n + 1})

    //read replacements from file and censor a text
    var replacements = scala.collection.mutable.Map[String, String]()
    val filename = "wordmap.txt"
    for (line <- Source.fromFile(filename).getLines()) {
      replacements.put(line.split(",")(0), line.split(",")(1))
    }

    println(new Polite().censor("Ass Shit Shoot Darn this mess", replacements))
  }
}