Feature: Inline embedding
  In order to cleanly separate pagelets from the main page
  As a Rails developer
  I want to be able to embed a secondary controller action as an inline pagelet

  Scenario: Simple pagelet embedding
    When I go to page one
    Then I should see "This text comes from page one"
    And I should see "This text comes from pagelet two"
    And I should see "This text is invisible for XHR requests"

  Scenario: Pagelet embedding with X-Requested-With header
    When I go to page one with xhr embedding
    Then I should see "This text comes from page one"
    And I should see "This text comes from pagelet two"
    And I should not see "This text is invisible for XHR requests"
