symptom(chicken_pox,high_fever).
symptom(chicken_pox,chills).
symptom(flu,chills).
symptom(cold,mild_body_ache).
symptom(flu,severe_body_ache).
symptom(cold,runny_nose).
symptom(flu,runny_nose).
symptom(flu,moderate_cough).
girl(priya).
girl(tiyasha).
girl(jaya).
can_cook(priya).
can_cook(jaya).
can_cook(tiyasha).
likes(priya, jaya) :- can_cook(jaya).
likes(priya, tiyasha) :- can_cook(tiyasha).