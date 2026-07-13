== Confidence

Imagine you are coming back to a city you visited a few years ago. Starting from your hotel, you start walking toward a specific place of interest, navigating around from memory rather than using your smartphone. At each intersection, you have to decide which street to take. Sometimes you feel almost certain you remember the vicinity correctly, and you move around without hesitation. Other times, you feel unsure, glance around for landmarks, or even stop to ask someone. Eventually you arrive to your destination, not necessarily through the fastest possible path.

Each of your decisions was accompanied by a sense of how likely you were to be right, before you actually found out. That feeling is _confidence_, a cornerstone of adaptive behavior that influences both decision-making and learning. It guides whether agents should seek more information, revise their beliefs, communicate with others, or commit to actions. Research on confidence spreads across several subfields of psychology, neuroscience, economics, artificial intelligence, and philosophy. In accordance with previous chapters, we will study it from the conceptual, computational and neural perspectives.

=== Conceptual overview

Everyone knows intuitively what confidence is about. Yet it is not that straightforward to characterize it from a scientific standpoint. We start by defining what confidence is (and is not). We then review how it can be measured experimentally, and its different roles in cognition.

==== Definition and distinctions

Confidence has been defined as a belief about the validity of our own thoughts, knowledge or performance that relies on a subjective feeling @grimaldiThereAreThings2015. This psychological, human-centered definition is challenged by recent advances in a nascent field: the neuroscience of confidence. In particular, studies have shown that the sense of confidence, from both behavioral and neuronal standpoints, is not specifically human but shared with other mammals like monkeys or rodents @kepecsNeuralCorrelatesComputation2008. Moreover, concepts like ”belief”, ”thought” and ”feeling” are problematic from a neuroscientific perspective. In the context of decision-making, confidence has been defined as the subjective estimate of decision quality @brusSourcesConfidenceValuebased2021, or more formally as the probability that a choice or proposition is correct given the available evidence @pougetConfidenceCertaintyDistinct2016. Confidence in one's own (hypothetical) decisions or actions is sometimes called _propositional confidence_ @flemingMetacognitionConfidenceReview. In a broader perspective, we argue that confidence can de defined as the subjective estimate of reliability for an internal cognitive variable. This formulation illustrates several key traits of confidence:

- Unlike a qualitative feeling or impression, it is a graded, quantitative signal;
- It always has an object which is related to one's own cognitive processes: a perception, a decision, a memory, etc;
- It is subjective, and may not match the objective property of its object.

Confidence is the outcome of a second-order judgment @flemingNeuralBasisMetacognitive2012. When you decide which street to take, a first-order cognitive process generates the choice itself, and a second-order process evaluates how reliable that choice is likely to be. Confidence judgments directly reflect a person's assessment of their own cognitive processes and are applicable to many domains (perception, memory, reasoning, decision-making, etc.). They are indeed the major and most widely studied form of metacognitive monitoring @flemingHowMeasureMetacognition2014, @flemingMetacognitionConfidenceReview.

Now that confidence has been more precisely defined, we should be able to distinguish it from related but non-identical constructs. This is the object of the following paragraphs.

===== Accuracy

Accuracy, the fact of being exact or correct, is an objective, externally observable property. On the contrary, confidence is subjective and subject-centric. Confidence may actually be decoupled from accuracy: two people (or the same person on two different occasions) can perform identically on a task while reporting very different levels of confidence. Systematic discrepancies define _overconfidence_ (confidence exceeds accuracy) and _underconfidence_ (the opposite). Both are pervasive problems in decision-making: for example, overconfidence has been linked to belief in conspiracy theories @pennycookFrameworkUnderstandingReasoning, anti-scientific stances @lightKnowledgeOverconfidenceAssociated2022, and susceptibility to misinformation @lyonsOverconfidenceNewsJudgments2021.

Confidence _calibration_ is the degree to which confidence matches accuracy. A well-calibrated agent expresses confidence levels that closely match their accuracy on the task they perform. Good calibration is more important for effective decision-making than high levels of confidence.

===== Certainty

Confidence and certainty are often used interchangeably in everyday language. At first glance, it may seem like confidence and uncertainty are merely the inverse (or reciprocal) of one another @meynielConfidenceBayesianProbability2015. In the context of decision-making, an argument can be made that they are in fact computationally distinct quantities @pougetConfidenceCertaintyDistinct2016. (Un)certainty refers to probabilistic representations of information over any sensory or cognitive variable (for example, how sure the visual system is about a moving object's direction). Certainty estimates are decision-independent: they exist whether or not any choice has been made. Confidence, by contrast, is inherently choice-dependent: there is no confidence without a decision to be confident about. The conceptual relationship between confidence and (un)certainty is very much the same as the relationship between ”summary statistics” (mean, standard deviation, etc.) and the data they describe @meynielConfidenceBayesianProbability2015. Confidence quantifies the degree of certainty associated with a cognitive variable. It is a scalar, task-specific estimate (for example, a numerical rating on a scale) derived from certainty distributions. As we shall see later (@par:conf_neural), this distinction is supported by research about the neural basis of confidence.

===== Error monitoring

Confidence and error monitoring are closely related metacognitive processes, but they differ in their primary focus. Confidence in the decision-making context refers to a graded estimate reflecting the decision-maker’s subjective certainty. In contrast, error monitoring concerns the detection and evaluation of mistakes after a response has been made, enabling corrective actions and behavioral adjustments. Both seem to share a reliance on post-decisional processing within the same systems responsible for the initial decision @yeungMetacognitionHumanDecisionmaking2012.

===== Trust

Confidence and trust play distinct roles in decision-making. Confidence is related to an internal cognitive variable (thought, knowledge, decision, etc). Trust is the willingness to rely on another person, system, or source despite uncertainty. Unlike confidence, it is a social construct implying a relationship between a _trustor_ and a _trustee_. A decision-maker may be highly confident in their own assessment while placing little trust in external advice.

==== Roles

Confidence performs multiple cognitive functions:
- Information-seeking and stopping rules
- Post-decisional error correction
- Learning rate modulation
- Communication and social coordination
- Motivation and effort allocation

An agent updates its belief toward a partner's opinion in proportion to the partner's expressed confidence and that confidence's historical reliability

==== Measurement

===== Methods

Confidence ratings
Post-decision wagering
Opt-out paradigm
Confidence forced choice

===== Measures

Sensitivity, bias, efficiency

=== Computational modeling

==== Monitoring

===== Statistical correlation

===== Signal Detection Theory

Type1/type2, meta-d', M-ratio etc (ManiscalcoLau2012)

===== Bayesian framework

Bayesian approaches conceptualize cognition as probabilistic inference.

Under this view:
1. The brain estimates hidden states.
2. It computes uncertainty regarding those estimates.
2. Confidence reflects posterior probability.

Confidence becomes a rational estimate of decision reliability.

$ "confidence" = P("correct"|"evidence") $

1. Sensory evidence is noisy.
2. The brain computes a posterior probability distribution over possible states of the world.
3. Confidence reflects the posterior probability associated with the chosen interpretation.

From a Bayesian perspective, an ideal observer maintains a posterior distribution over hypotheses. Confidence corresponds to the posterior probability of the chosen hypothesis. Upon observing evidence e and choosing hypothesis H1, confidence = P(H1 | e).

For example:

- If evidence strongly favors option A over B, posterior probability for A is high.
- Confidence should therefore be high.

From this perspective, confidence is not a separate process. It is an intrinsic property of probabilistic inference.

===== Hierarchical Models

Several findings challenge the idea that confidence is simply posterior probability: biases, heuristics, dissociation from accuracy.

This suggests confidence may depend on information not fully used in the primary decision itself.

Confidence may be generated by a second-order inference process:
- First Level: produces decisions.
- Second Level: attempts to infer whether the first level was correct.

The second level has limited information and therefore introduces additional noise.

Consequences:
- Confidence is correlated with accuracy.
- Confidence is imperfect.
- Confidence biases emerge naturally.

The confidence judgment itself is an inference. The brain does not directly "read out" confidence.

===== Sequential sampling models

Confidence reports often improve when measured shortly after a decision rather than simultaneously.

===== Active inference

Precision (1/uncertainty or 1/variance)

==== Control

Confidence is not merely a report made after a decision — it is an active computational signal that the brain uses to continuously tune several aspects of cognition and behavior:
- Gating Changes of Mind (Folke2017)
- Modulating Learning Rates (Behrens2007, Hierarchical Gaussian Filter  Mathys2011)
- Guiding Exploration vs. Exploitation (Daw2006, Upper Confidence Bound (UCB) algorithm)
- Internal Reward Signal (Feedback-Free Learning) (Guggenmos2016, Ptasczynski2022)

Exploration Vs exploitation.

High confidence can stabilize current strategies.

Modulation of evidence-gathering and learning, withdrawal.

Aberrant learning-rate modulation by confidence is hypothesised to underlie belief fixity in delusions and excessive updating in anxiety.

FlemingDaw2017

the brain uses confidence estimates to regulate behavior across multiple timescales:
- Immediately: whether to commit, wait, change one's mind, or seek more evidence.
- Across trials: how much to learn from feedback.
- Across tasks: whether to explore alternatives or exploit current knowledge.
- Socially: whether to communicate certainty or defer to others.

Confidence interacts with estimates of volatility and uncertainty (Niv, Daw).

===== Confidence prediction errors

The agent learns not only about the world but about the reliability of its own decision processes.

===== PROBE

=== Neural basis <par:conf_neural>

Several neural markers correlate with confidence.

Single-Neuron Activity

In primates, neurons in prefrontal and parietal regions encode confidence-like signals.

Electrophysiology

Electroencephalography reveals confidence-related signatures including:

- Error-related negativity (ERN)
- Error positivity (Pe)
- Decision-related accumulation signals

Neuroimaging

Functional MRI studies consistently identify confidence-related activation in:

- Anterior prefrontal cortex
- Medial frontal cortex
- Insula
- Parietal cortex

Together these findings support the idea of distributed confidence networks.

Error-related negativity (ERN)
Error positivity (Pe)

Confidence and (un)certainty likely rely on distinct neural implementations — certainty encoded locally within domain-specific sensory and cognitive areas, and confidence computed downstream in associative regions such as orbitofrontal or prefrontal cortex — making the conceptual distinction essential for interpreting neural data on decision-making.
