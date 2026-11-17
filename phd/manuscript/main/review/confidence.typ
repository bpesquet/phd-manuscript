#import "../../utils.typ"
#import utils.acrostiche: acr
#import utils: flex-caption

== Confidence

Imagine that you are coming back to a city you visited a few years ago. Starting from your hotel, you begin walking toward a specific place of interest, navigating around from memory rather than using your smartphone. At each intersection, you have to decide which street to take. Sometimes you feel almost certain you remember the neighborhood correctly, and you move around without hesitation. Other times, you feel unsure, glance around for landmarks, or even stop to ask someone. Eventually you arrive to your destination, not necessarily through the fastest possible path.

During this trip, each of your decisions was accompanied by a sense of how likely you were to be right, before you actually found out. That feeling is _confidence_, a cornerstone of adaptive behavior that influences both decision-making and learning. It guides whether agents should seek more information, revise their beliefs, communicate with others, or commit to actions. Research on confidence spreads across several subfields of psychology, neuroscience, economics, artificial intelligence, and philosophy. In accordance with previous chapters, we will study it from the conceptual, computational and neural perspectives.

=== Conceptual overview

Everyone knows intuitively what confidence is about. Yet, it is not that straightforward to characterize it from a scientific standpoint. We start by defining what confidence is (and is not). Afterwards, we review how it can be experimentally measured, and study its different roles in cognition.

==== Definition and distinctions

Confidence has been defined as a belief about the validity of our own thoughts, knowledge or performance that relies on a subjective feeling @grimaldiThereAreThings2015. This psychological, human-centered definition is challenged by recent advances in an emergent field: the neuroscience of confidence. In particular, studies have shown that the sense of confidence, from both behavioral and neuronal standpoints, is not specifically human but shared with other mammals like monkeys or rodents @kepecsNeuralCorrelatesComputation2008. In the narrower context of decision-making, confidence has been defined as the subjective estimate of decision quality @brusSourcesConfidenceValuebased2021, or more formally as the probability that a choice or proposition is correct given the available evidence @pougetConfidenceCertaintyDistinct2016. Confidence in one's own (hypothetical) decisions or actions is sometimes called _propositional confidence_ @flemingMetacognitionConfidenceReview. In a more general perspective, we propose that confidence can de defined as _the subjective, graded estimate of how likely a belief, valuation, decision, or action is to be correct, accurate, or successful_. By belief, we mean an internal representation, held by an agent, that a proposition or percept corresponds to the actual state of the world. The previous definition illustrates several key traits of confidence:

- Unlike a qualitative feeling or impression, it is a graded, quantitative signal;
- It always has an object related to one's own cognitive processes: a perception, a decision, a memory, etc;
- It is subjective, and may not match the objective property of its object.

Confidence is the outcome of a second-order judgment @flemingNeuralBasisMetacognitive2012. When you decide which street to take, a first-order cognitive process generates the choice itself, and a second-order process evaluates how reliable that choice is likely to be. Confidence judgments directly reflect a person's assessment of their own cognitive processes and are applicable to many domains (perception, memory, reasoning, decision-making, etc.). They are indeed the major and most widely studied form of metacognitive monitoring @flemingHowMeasureMetacognition2014, @flemingMetacognitionConfidenceReview.

Now that confidence has been formally defined, we should be able to distinguish it from related but non-identical constructs. This is the object of the following paragraphs.

===== Accuracy <par:confidence_accuracy>

Accuracy, the fact of being exact or correct, is an objective, externally observable property. On the contrary, confidence is subjective and subject-centric. Confidence may actually be decoupled from accuracy: two people (or the same person on two different occasions) can perform identically on a task while reporting very different levels of confidence. Systematic discrepancies define _overconfidence_ (confidence exceeds accuracy) and _underconfidence_ (the opposite). Both are pervasive problems in decision-making: for example, overconfidence has been linked to belief in conspiracy theories @pennycookFrameworkUnderstandingReasoning, anti-scientific stances @lightKnowledgeOverconfidenceAssociated2022, and susceptibility to misinformation @lyonsOverconfidenceNewsJudgments2021.

Confidence _calibration_ is the degree to which confidence matches accuracy. A well-calibrated agent expresses confidence levels that closely match their performance on the task they perform. Good calibration avoids the pitfalls of overconfidence and underconfidence, and is more important for effective decision-making than high levels of confidence.

===== Certainty

Confidence and certainty are often used interchangeably in everyday language. At first glance, it may seem like confidence and uncertainty are merely the inverse (or reciprocal) of one another @meynielConfidenceBayesianProbability2015. However, an argument can be made that they are in fact computationally distinct quantities @pougetConfidenceCertaintyDistinct2016. (Un)certainty refers to probabilistic representations of information over any sensory or cognitive variable: for example, how sure the visual system is about a moving object's direction. Certainty estimates are decision-independent: they exist whether or not any choice has to be made. Confidence, by contrast, is inherently choice-dependent: there is no confidence without a decision to be confident about. The conceptual relationship between confidence and (un)certainty is very much the same as the relationship between ”summary statistics” (mean, standard deviation, etc.) and the data they describe @meynielConfidenceBayesianProbability2015. Confidence quantifies the degree of certainty associated with its object. It is a scalar, task-specific estimate (for example, a numerical rating on a scale) derived from certainty distributions. As we shall see later (@par:conf_neural), this distinction is supported by research about the neural basis of confidence.

===== Error monitoring

Confidence and error monitoring are closely related metacognitive processes, but they differ in their primary focus. Confidence in the decision-making context refers to a graded estimate reflecting the decision-maker’s subjective certainty. In contrast, error monitoring concerns the detection and evaluation of mistakes after a response has been made, enabling corrective actions and behavioral adjustments. Both seem to share a reliance on post-decisional processing within the same systems responsible for the initial decision @yeungMetacognitionHumanDecisionmaking2012.

===== Trust

Confidence and trust play distinct roles in decision-making. Confidence is a subjective estimation of reliability about a belief, valuation, decision, or action. Trust is the willingness to rely on another person, system, or source despite uncertainty. Unlike confidence, it is a social construct implying a relationship between a _trustor_ and a _trustee_. Trust carries an expectation not just of competence but often of goodwill and honesty. A decision-maker may be highly confident in their own assessment while placing little trust in external advice (or the other way around).

==== Measurement

As a subjective, internal quantity, confidence cannot be observed directly. Explicit confidence reports (via textual or numerical ratings) are only accessible to humans. Setups involving non-human animals like rodents are primates are restricted to implicit reports @kepecsNeuralCorrelatesComputation2008. Over the past decades, several experimental paradigms have been developed to elicit confidence, together with statistical measures that extract meaningful quantities from the resulting data. In order to study confidence in the decision-making context, a distinction is made between the decision to take, called a first-order, object-level or _type 1_ task, and the expression of confidence about it, called a second-order, meta-level or _type 2_ task. This corresponds to specific flows of information in the decision-maker's cognitive system (@fig:type1_type2_tasks).

#figure(
  image("images/confidence/mamassianVisualConfidence2020_1.png", width: 100%),
  caption: flex-caption(
    short: [Flow of information for perceptual and confidence judgments],
    long: [Flow of information for perceptual (type 1) and confidence (type 2) judgments. Perceptual decisions rely on sensory evidence (physical stimulus $U$) and may be corrupted by sensory noise $N$. Confidence judgments rely on confidence evidence that can be a noisy duplicate of the sensory evidence (serial stream), a novel estimation of the stimulus (parallel stream), or a combination of both. Confidence evidence may also be corrupted by confidence noise $M$. Adapted from @mamassianConfidenceForcedChoiceOther2020.],
  ),
) <fig:type1_type2_tasks>

===== Methods

The most straightforward measurement protocol is the _confidence rating_, in which, immediately after a decision,  participants report their level of confidence about it on a discrete scale (e.g., from "guessing" to "certain"). Ratings are simple to collect and widely used, but rely on participants' ability and willingness to translate an internal estimate into a numerical report. This introduces individual differences in scale usage that complicate comparisons across participants or conditions [36]. Moreover, it may also lead to possible confusions between type 1 and type 2 judgments: confidence rating scales can be interpreted by the observer as a mean to report finer sensory judgments (a type 1 task) instead of evaluating the correctness of their decision (a type 2 task) @mamassianConfidenceForcedChoiceOther2020.

Pioneered in experimental psychology nearly a century ago, the _uncertain option_ method adds another alternative, the "uncertain option", to the available responses. It has been applied to contexts where verbal reporting is impossible, such as experiments involving monkeys, dolphins, rats and pigeons. A challenge is that it can be interpreted as a $n+1$ type 1 only task solved by learning stimulus-response categories, without necessitating confidence estimations @kepecsComputationalFrameworkStudy2012.

The _opt-out_ paradigm, also suitable for animal research, offers participants (human or non-human) the option to decline a trial in exchange for a smaller but guaranteed reward, instead of risking the larger reward associated with a correct first-order response. Participants should opt out selectively on the trials where they are more likely to be wrong, so opt-out provides a behavioral proxy for confidence without requiring introspective report.

_Post-decision wagering_ replaces verbal or numerical reports with an incentive-compatible behavior: after a decision, subjects are asked to gamble on whether their response was correct. If the decision is correct, the wager amount is kept. The amount of the bet is assumed to reflect a subject’s confidence in his or her decision @flemingNeuralBasisMetacognitive2012 (@fig:confidence_protocols_animals).

Finally, the _confidence forced-choice_ paradigm sidesteps individual scale biases by asking participants to directly compare their confidence across two decisions, choosing for which of the two they are more confident, rather than rating each decision separately. Because it relies on relative rather than absolute judgments, this method is particularly well-suited to comparing confidence across different tasks, modalities, or conditions that would otherwise be hard to place on a common scale @mamassianConfidenceForcedChoiceOther2020.

#figure(
  image("images/confidence/kepecsComputationalFramework2012_1.png", width: 70%),
  caption: flex-caption(
    short: [Experimental protocols for stuying confidence in animals],
    long: [Experimental protocols for stuying confidence in animals. _(a) _ Uncertain option tasks add an additional choice to the available responses A nd B. _(b)_ Opt-out tasks offer the possibility of declining the test and receiving a smaller reward. In a fraction of trials, the option to decline is omitted. _(c)_ In post-decision wagering, there is first a type 1 task (here a two-category discrimination between A or B), and then a confidence report, such as low (L) or high (H) options. Adapted from @kepecsComputationalFrameworkStudy2012.],
  ),
) <fig:confidence_protocols_animals>

===== Measures

Once confidence has been elicited by one of the methods above, several statistical measures can be computed from the resulting data, each capturing a distinct property of metacognition.

_Metacognitive sensitivity_ (also called confidence or type 2 sensitivity) captures the capacity of a decision-maker to correlate confidence judgments and objective task performance. For example, being highly confident when taking correct decisions and less confident otherwise demonstrates a high degree of sensitivity. In other words, metacognitive sensibility evaluates confidence calibration (@par:confidence_accuracy). It is is often affected by task performance itself: an individual will appear to have greater sensitivity on an easy task compared to a hard task @flemingHowMeasureMetacognition2014. Metacognitive sensibility should not be confused with type 1 sensitivity (@par:decision_sdt).

_Metacognitive bias_ (also called confidence or type 2 bias) describes a difference in subjective confidence despite constant task performance. Two individuals with identical metacognitive sensitivity may nonetheless differ systematically in their average confidence level, one being chronically over- or underconfident (@fig:confidence_measures) .

#figure(
  image("images/confidence/flemingMeasuringMetacognition2014_1.png", width: 75%),
  caption: flex-caption(
    short: [Theoretical dissociation between metacognitive sensitivity and bias],
    long: [Theoretical dissociation between metacognitive sensitivity and bias. Each graph shows a hypothetical probability density of confidence ratings for correct and incorrect trials. Metacognitive sensitivity corresponds to the degree of separation between the distributions. Metacognitive bias relates to the overall level of confidence expressed, regardless of the correctness of the trial. Note that contrary to this schematic example, real confidence distributions are unlikely to be Gaussian. Adapted from @flemingHowMeasureMetacognition2014.],
  ),
) <fig:confidence_measures>

_Metacognitive efficiency_ (also called confidence efficiency) is a decision-maker’s level of metacognitive sensitivity given a certain level of task performance. Type 2 sensitivity is mechanically dependent on type 1 task performance: an agent who's better at the primary task will tend to show higher sensibility almost by construction. Efficiency relates metacognitive sensitivity to first-order task performance, typically through normalization (@par:confidence_sdt). This helps isolating metacognitive performance from task difficulty.

Together, sensitivity, bias, and efficiency provide complementary views of an agent's metacognitive ability.

==== Roles

onfidence is not only a retrospective estimate, but an active variable that is involved in many cognitive functions.C

First of all, confidence determines whether a decision-maker should commit to a choice or wait for more information. Within an evidence accumulation framework (@par:decision_eam), low confidence calls for further sampling, whereas high confidence favors early commitment to a choice. The link between confidence and the #acr("SAT") (@par:sat) has been empirically demonstrated: confidence on a given decision predicts the balance of speed and accuracy adopted on the subsequent one, suggesting that decision-makers use their own confidence as an internal signal for tuning future deliberations @desenderConfidencePredictsSpeedaccuracy2019.

Because evidence accumulation can continue briefly after a decision is taken (@par:ddm, @fig:ddm_collapsing_bounds), confidence also enables corrective actions after a choice has been made. Post-decisional evidence accumulation can drive changes of mind @resulajChangesMindDecisionmaking2009. Explicit representations of confidence appear necessary for this process: participants who report low confidence in a choice are more likely to reverse that choice when the same options are presented again later. This relationship is strongest for well-calibrated agents @folkeExplicitRepresentationConfidence2016.

Confidence also impacts how strongly an agent updates its internal states in light of new evidence. Under a Bayesian view of confidence (Section II.3.2.1.3), an agent that is already highly confident in its current belief should update that belief only modestly upon receiving discrepant evidence, whereas an agent with low confidence should revise its belief substantially. Formalized as an effective learning rate, this principle allows confidence to modulate the balance between stability and flexibility in learning, and has been proposed as a general computational bridge between confidence, uncertainty, and volatility (Section II.1.1.5) [40].

Confidence performs multiple cognitive functions:
- Information-seeking and stopping rules
- Post-decisional error correction
- Learning rate modulation
- Communication and social coordination
- Motivation and effort allocation

An agent updates its belief toward a partner's opinion in proportion to the partner's expressed confidence and that confidence's historical reliability

=== Computational modeling

==== Monitoring

===== Statistical correlation

===== Signal Detection Theory <par:confidence_sdt>

Type1/type2, meta-d', M-ratio etc (ManiscalcoLau2012)

B. Maniscalco and H. Lau, "A Signal Detection Theoretic Approach for Estimating Metacognitive Sensitivity from Confidence Ratings," Consciousness and Cognition, vol. 21, no. 1, pp. 422–430, Mar. 2012, doi: 10.1016/j.concog.2011.09.021

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

R. Kiani and M. N. Shadlen, "Representation of Confidence Associated with a Decision by Neurons in the Parietal Cortex," Science, vol. 324, no. 5928, pp. 759–764, May 2009, doi: 10.1126/science.1169405
