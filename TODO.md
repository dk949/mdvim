# TODO


* [X] Fix highlighting (and locale) for spelling
* [ ] Highlighting and concealment for emacs-style citations
    * Conceal as  `[@citation_name] -> [#]`
    * Highlight as
        ```
        [@citation_name]
        ^^^-----------^^
        12      3      4

        1, 4 -> Operator
        2    -> Comment
        3    -> markdownUrl

        [#]
        ^^^
        123

        1, 3 -> Operator
        2    -> markdownUrl
        ```
