; This is a new rule -- the previous version of relex had an all-rule, but no quantity rule.
; I am not porting the all-rule, because it seems silly to pick out that one quantifier for 
; its own rule, but none of the others -- some, many, few etc. etc. which also get _quantity
; (AN June 2015)

(define quantity
    (BindLink
        (VariableList
            (TypedVariableLink
                (VariableNode "$a-parse")
                (TypeNode "ParseNode")
            )
            (TypedVariableLink
                (VariableNode "$noun")
                (TypeNode "WordInstanceNode")
            )
            (TypedVariableLink
                (VariableNode "$quant")
                (TypeNode "WordInstanceNode")
            )
        )
        (AndLink
            (WordInstanceLink
                (VariableNode "$noun")
                (VariableNode "$a-parse")
            )
            (WordInstanceLink
                (VariableNode "$quant")
                (VariableNode "$a-parse")
            )
            (EvaluationLink
                (DefinedLinguisticRelationshipNode "_quantity")
                (ListLink
                    (VariableNode "$noun")
                    (VariableNode "$quant")
                )
            )
        )
        (ExecutionOutputLink
       	   (GroundedSchemaNode "scm: pre-quantity-rule")
       	      (ListLink
       	         (VariableNode "$noun")
       	         (VariableNode "$quant")
            )
        )
    )
)

(InheritanceLink (stv 1 .99) (ConceptNode "quantity-Rule") (ConceptNode "Rule"))

(ReferenceLink (stv 1 .99) (ConceptNode "quantity-Rule") quantity)

; This is function is not needed. It is added so as not to break the existing
; r2l pipeline.
(define (pre-quantity-rule noun quant)
    (quantity-rule (word-inst-get-word-str noun) (cog-name noun)
              (word-inst-get-word-str quant) (cog-name quant)
    )
)


