# Computational fluid dynamics for solving parabolic partial differential equations using implicit and explicit methods.
The two matlab program compares two approaches to discretize and solve a parabolic partial differential equation based on implicit
and explicit solution.
We observe that Lambda value which is equivalent of (Beta*dt*dt)/dx decides the stability in case of explicit based approach. If
the lambda value is greater than 0.5, the equation becomes unstable.
Implicit approach may be a bit slower as compared to explicit approach, but is stable over variety of Lambda values.
