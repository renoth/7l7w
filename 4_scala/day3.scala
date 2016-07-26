import scala.io._
import scala.actors._

var urls = List("https://www.google.com/", "https://www.heise.de/", "http://www.spiegel.de/")
val linkRegex = "(?i)<a.+?href=\"(http.+?)\".*?>(.+?)</a>".r

object PageLoader {
  def getPageSizeAndLinks(url: String) = {
    val page = Source.fromURL(url).mkString
    val linkList = linkRegex.findAllIn(page).matchData.toList.map(_.group(1))
    (page.length, linkList)
  }

  def getPageSize(url: String) = {
    try {
      Source.fromURL(url).mkString.length
    } catch {
      case e: Exception => System.err.println(e)
      0
    }}
}

def timeMethod(method: () => Unit) = {
  val start = System.nanoTime
  method()
  val end= System.nanoTime

  println("Method took " + (end - start) / 1000000000.0 + " seconds.")
}

def getPageSizeSequentially() = {
  for(url <- urls) {
    var totalSize = 0
    val (size, links) = PageLoader.getPageSizeAndLinks(url)
    totalSize += size
    for (link <- links) {
      println(link)
      totalSize += PageLoader.getPageSize(link)
    }
    println("Total link size for " + url + " : " + totalSize)
  }
}

timeMethod { getPageSizeSequentially }

