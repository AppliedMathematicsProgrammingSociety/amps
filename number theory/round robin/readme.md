## Round-Robin Scheduling for n teams
A round-robin tournament (or all-go-away-tournament) is a competition in which each contestant meets every other participant, exactly once, usually in turn.

The code uses congruence to schedule a Round-Robin tournament for **n** teams. The tournament lasts **n-1** days (or rounds).First, note that if N is odd, not all teams can be scheduled in each round, because
when teams are paired, the total number of teams playing is even. So, if N is odd, we add
a dummy team, and if a team is paired with the dummy team during a particular round,
it draws a bye in that round and does not play. Hence, we can assume that we always
have an even number of teams, with the addition of a dummy team if necessary.

We label the N teams with the integers 1, 2, 3, ... , n - 1, n. We construct a
schedule, pairing teams in the following way. We have team i, with i ≠ n, play team
j, with j ≠ n and j ≠ i, in the kth round if i + j = k (mod n - 1). This schedules
games for all teams in round k, except for team n and the one team i for which
2i = k (mod n - 1). There is one such team because the
congruence 2x = k (mod n - 1) has exactly one solution with 1 ≤ x ≤ n - 1, because
(2, N - 1) = 1. We match this team i with team n in the kth round.

### Teams
![teams](https://user-images.githubusercontent.com/119177863/222916469-eb28ae0d-e6a3-4752-979a-f63ceb80321d.png)

### How it works
for odd number of teams

![1](https://user-images.githubusercontent.com/119177863/222917706-5964037c-67b7-48c8-bdd2-d37ae148bd20.gif)

for even number of teams

![2](https://user-images.githubusercontent.com/119177863/222917716-6594b83f-bc22-4789-8a47-51695dffa424.gif)

### Algorithm
![round_robin_scheduling_algorithm](https://user-images.githubusercontent.com/119177863/222915973-0a6bdb3f-061f-4522-bdf2-6659fa0974c5.png)

### Flowchart
![round_robin_scheduling_flowchart](https://user-images.githubusercontent.com/119177863/222915997-3495a609-2cb2-48a7-a1f4-0454c7b2ee17.png)
