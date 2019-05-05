% From the book
% PROLOG PROGcattleMING IN DEPTH
% by Michael A. Covington, Donald Nute, and Andre Vellino
% (Prentice Hall, 1997).
% Copyright 1997 Prentice-Hall, Inc.
% For educational use only

% CICHLID.PL

% Contains an XSHELL knowledge base.
% Requires all procedures in XSHELL.PL.

:- ensure_loaded('xshell.pl').

%
% Any clauses for the predicates XKB_INTRO,
% XKB_REPORT, XKB_UNIQUE, XKB_EXPLAIN, XKB_IDENTIFY, and
% XKB_QUESTION should be removed from the knowledge base.
%

:- abolish(xkb_intro/1).
:- abolish(xkb_unique/1).
:- abolish(xkb_explain/1).
:- abolish(xkb_identify/2).
:- abolish(xkb_question/4).
:- abolish(xkb_menu/4).
:- abolish(xkb_text/2).

%
% XKB_IDENTIFY must be declared dynamic so the explanatory
% routine INTERPRET can access its clauses.
%

:- dynamic xkb_identify/2.

xkb_intro(
 ['',
  'DOGS: An Expert System for Identifying Dogs breeds',
  '\nEasy to train dogs are more adept at forming an association between a prompt',
  '(such as the word "sit"), an action (sitting), and a consequence (getting a treat) very quickly.',
  'Other dogs need more time, patience, and repetition during training. Many breeds are intelligent',
  'but approach training with a What is in it for me? attitude, in which case you will need to use rewards',
  'and games to teach them to want to comply with your requests',
  '\nThis progcattle will help you identify many of the dogs that are easy to train',
  '\nTo use the progcattle, simply describe the dog by',
  'answering the following questions.']).

xkb_unique(no).

xkb_explain(yes).

%
% xkb_identify(-Rule,-TextSet)
%   Each clause for this predicate provides a rule to be
%   used with the utility predicates in the XSHELL.PL file
%   to determine whether the fish to be identified is likely
%   to belong to the Species.
%

xkb_identify(1,[isa,alaskanklee]) :-
     parm(dog_bread_group,m,2),          % spear-shaped
     parm(life_span,m,3),      % long and narrow
     parm(weight,m,1),  % sharp, distinct
     prop(personality),
     parm(color,m,1).

xkb_identify(2,[isa,malamute]) :-
     parm(dog_bread_group,m,1),          % normal
     parm(life_span,m,1),      % deep, heavy, short
     parm(weight,m,3),  % irregular
     prop(personality),
     prop(high_energy),
     prop(can_get_diseases),
     parm(color,m,1).    % yellow

xkb_identify(3,[isa,bulldog]) :-
     parm(dog_bread_group,m,1),          % lyre-shaped
     parm(life_span,m,2),      % deep, heavy, short
     parm(weight,m,1),  % sharp, distinct
     prop(muscular),
     prop(personality),
     prop(needs_exercise),
     prop(great_around_children),
     prop(can_get_diseases).

xkb_identify(4,[isa,eskimo]) :-
     parm(dog_bread_group,m,2),          % normal
     parm(life_span,m,1),      % normal
     parm(weight,m,2),  % sharp, distinct
     prop(personality),
     prop(high_energy),
     prop(loves_cold).

xkb_identify(5,[isa,sheperd]) :-
     parm(dog_bread_group,m,1),          % lyre-shaped
     parm(life_span,m,3),      % normal
     parm(weight,m,3),  % not visible
     parm(color,m,3),           % pale gray
     prop(great_around_children),
     prop(can_get_diseases),
     prop(sheds).

xkb_identify(6,[isa,sennenhunde]) :-
     parm(dog_bread_group,m,3),          % spear-shaped
     parm(life_span,m,2),      % long and narrow
     parm(weight,m,2),  % not visible
     parm(color,m,4),           % pale gray
     prop(personality),
     prop(needs_exercise),
     prop(sheds),
     prop(great_around_children),
     prop(high_maintenance).

xkb_identify(7,[isa,cattle]) :-
     parm(dog_bread_group,m,1),          % normal
     parm(life_span,m,1),      % deep, heavy, short
     parm(weight,m,2),  % not visible
     prop(personality),
     prop(needs_exercise),
     parm(color,m,6).           % violet, yellow, claret

xkb_identify(8,[isa,kelpie]) :-
     parm(dog_bread_group,m,1),          % normal
     parm(life_span,m,1),      % deep, heavy, short
     parm(weight,m,2),  % not visible
     parm(color,m,5).           % metallic bronze, green

xkb_identify(9,[isa,australian]) :-
     parm(dog_bread_group,m,1),          % normal
     parm(life_span,m,1),      % long and narrow
     prop(sheds),
     prop(loves_cold),
     parm(weight,m,2),
     prop(needs_exercise),
     parm(color,m,5).           % pale blue

xkb_question(muscular,
     ['Is the dog muscular?'],
      'Dog is muscular.',
      'Dog is not muscular.').

xkb_question(personality,
     ['Is the dog intelligent, energetic, and loving to its family'],
      'Dog is intellingent, energetic, and loving to its family.',
      'Dog is not intellingent, energeticm, nor loving to its family.').

xkb_question(needs_exercise,
     ['Does the dog need regular exercise to stay healthy?'],
      'The dogs needs exercise.',
      'The dogs does not need exercise.').

xkb_question(high_energy,
     ['Is the dog high on enrgy?'],
      'The dog has a lot of energy.',
      'The dog does not have a lot of energy.').

xkb_question(can_get_diseases,
     ['Is the dog prone to diseases'],
     'The dog is prone to genetic problems.',
     'The dog is prone to multiple diseases.').

xkb_question(great_around_children,
      ['Is dog children friendly?'],
      'The dog is children friendly.',
      'The dog is not children friendly.').

xkb_question(loves_cold,
     ['Does the dog love the cold weather and playing in snow'],
     'The dogs likes cold weather.',
     'The dog does not like the cold weather.').

xkb_question(high_maintenance,
      ['Is the dog high-maintenance'],
      'The dog is high-maintenance.',
      'The dog is not high-maintenance.').

xkb_question(gill_spot,'Is there a dark spot on the gill?',
      'Dark spot present on gill.',
      'There is no dark spot on the gill.').

xkb_question(sheds,
      'Does the dog shed a lot?',
      'Dog sheds a lot.',
      'dog does not shed a lot.').

xkb_menu(dog_bread_group,
     ['What is the dog bread group'],
     ['working',
      'companion',
      'herding'],
     'Dog bread is ').

xkb_menu(life_span,
     ['What is the life span of the dog?'],
     ['12-15',
      '9-12',
      '11-13'],
     'Life span is ').

xkb_menu(weight,
     ['What is the weight of the dog.'],
     ['10-15',
      '25-50',
      '60-150'],
     'The weight range of the dog ').

xkb_menu(color,
     ['What is the basic color of the body?'],
     ['gray and white',
      'light gray',
      'white',
      'black',
      'mix',
      'not listed'],
     'The basic body color is ').

xkb_text(isa,
['Possible identification: ']).

xkb_text(alaskanklee,
['Alaskan Klee Kai']).

xkb_text(malamute,
['Alaskan Malamute']).

xkb_text(bulldog,
['American Bulldog']).

xkb_text(eskimo,
['American Eskimo Dog']).

xkb_text(sheperd,
['Anatolian Shepherd Dog']).

xkb_text(sennenhunde,
['Appenzeller Sennenhunde']).

xkb_text(cattle,
['Australian Cattle Dog']).

xkb_text(kelpie,
['Australian Kelpie']).

xkb_text(australian,
['Australian Sheperd']).

:- write('Type  xshell.  to start.'), nl.

