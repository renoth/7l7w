% Represent books and authors of books

book(sicp).
book(gebegb).
book(sevenlanguagessevenweeks).
book(randombook).

author(sicp,sussmannabelson).
author(gebegb,hofstadter).
author(sevenlanguagessevenweeks,tate).
author(randombook,randomauthor).

% Query: author(X,tate).

% Represent musicians and instruments

musician(anna, guitar).
musician(ben, guitar).
musician(chris, piano).
musician(dennis, drums).

genre(anna, metal).
genre(ben, pop).
genre(chris, metal).
genre(dennis, rock).

% Find all musicians playing the guitar:

plays_guitar(X) :- musician(X, guitar).