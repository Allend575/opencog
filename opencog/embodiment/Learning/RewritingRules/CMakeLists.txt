ADD_LIBRARY(RewritingRules
	hillclimbing_full_reduction
	hillclimbing_perception_reduction
	hillclimbing_action_reduction
	post_learning_rules
	post_learning_rewriting
	RewritingRules
)

TARGET_LINK_LIBRARIES(RewritingRules
	${COGUTIL_LIBRARY}
	comboreduct
	AvatarComboVocabulary
)
