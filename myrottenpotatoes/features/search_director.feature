Feature: search for movies by director

Background: movies in database

  Given the following movies exist:
  | title                   | rating | release_date | director        |
  | Aladdin                 | G      | 25-Nov-1992  |                 |
  | The Terminator          | R      | 26-Oct-1984  |                 |
  | When Harry Met Sally    | R      | 21-Jul-1989  |                 |
  | The Help                | PG-13  | 10-Aug-2011  |                 |
  | Chocolat                | PG-13  | 5-Jan-2001   |                 |
  | Amelie                  | R      | 25-Apr-2001  |                 |
  | 2001: A Space Odyssey   | G      | 6-Apr-1968   | Stanley Kubric  |
  | The Incredibles         | PG     | 5-Nov-2004   |                 |
  | Raiders of the Lost Ark | PG     | 12-Jun-1981  |                 |
  | Chicken Run             | G      | 21-Jun-2000  |                 |
  | Ben-Hur                 | G      | 21-Jun-2000  | Stanley Kubric  |

Scenario: add director to existing movie
  When I go to the edit page for "2001: A Space Odyssey"
  And I fill in "director" with "Stanley Kubric"
  And I press "Update Movie Info"
  Then the director of "2001: A Space Odyssey" should be "Stanley Kubric"

Scenario: find movie with same director
  Given I am on the details page for "2001: A Space Odyssey"
  When I follow "Find Movies with same Director"
  Then I should be on the Similar Movies page for "2001: A Space Odyssey"
  And I should see "Ben-Hur"
  And I should not see "Chicken Run"

Scenario: we don't know the director
  Given I am on the details page for "Chicken Run"
  When I follow "Find Movies with same Director"
  Then I should be on the home page
  And I should see "'Chicken Run' has no director info"