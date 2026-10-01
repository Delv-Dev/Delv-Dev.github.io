# A.I.D

## Project Overview

A.I.D is an arcade action-defense game where the player protects a city from Martin and his incoming attacks. During combat, the player must divide their attention between defending buildings, avoiding threats, managing limited energy, and finding opportunities to damage the boss.

**Genre:** Arcade Action / Defense  
**Role:** Game Designer  
**Engine:** Unity  
**Development Time:** 5 days  
**Team Size:** [To confirm]

## Gameplay Video

A short gameplay video showing the main combat cycle, drone interaction, missile redirection, gravity phase, and final boss encounter.

**Video:** [To be added]

## My Role and Responsibilities

As a Game Designer, I worked on the gameplay systems, combat flow, player objectives, resource management, boss phases, HUD requirements, and overall player experience.

My contributions included:

- Developing and refining the core gameplay loop.
- Designing the player’s energy-management system.
- Defining the drone recharge and energy-transfer interactions.
- Designing Martin’s UFO, Missile, and Gravity phases.
- Establishing the building-based defeat condition.
- Designing the missile-redirection mechanic.
- Balancing offensive, defensive, and resource-management priorities.
- Planning HUD information and player feedback.
- Testing gameplay scenarios and identifying unclear or broken interactions.
- Collaborating on visual direction and gameplay polish.

## Design Goal

The main design goal was to create a boss battle where the player could not focus only on dealing damage. The player needed to constantly choose between protecting the city, protecting themselves, restoring energy, and attacking Martin.

These overlapping responsibilities were intended to create pressure through decision-making rather than through combat difficulty alone.

## Core Gameplay Loop

**Defend the City → Avoid or Redirect Attacks → Manage Energy → Request Drone Support → Exploit Martin’s Vulnerability → Repeat**

The player has limited energy and cannot recover it simply by waiting. Energy must be restored through drone support or recovered after reaching an overheat state. This forces the player to actively plan when to attack and when to disengage.

## Key Systems

### Energy Management

Energy powers the player’s combat actions. When energy becomes low, the player can request a transfer from the drone. Reaching overheat temporarily limits the player before restoring their energy.

The system creates a risk-and-recovery rhythm: aggressive play provides more offensive opportunities, but poor energy management can leave the player vulnerable.

### Drone Support

The drone supports two different energy interactions:

- The player can request energy from the drone.
- The drone can recharge itself.

Both actions can be started or cancelled by the player. This turns the drone into a resource that must also be managed rather than an unlimited source of energy.

### Boss Phases

Martin’s encounter is divided into three major phases:

- **UFO Phase:** The player responds to enemy pressure while protecting the city.
- **Missile Phase:** Missiles can threaten the environment or be redirected toward Martin.
- **Gravity Phase:** The player must complete the objective before the remaining core causes immediate defeat.

Each phase introduces a different type of pressure while remaining connected to the same central objective.

### Missile Redirection

Missiles can be redirected back toward Martin. A successful redirect reduces the duration of Martin’s shield, giving the mechanic an offensive purpose beyond simply avoiding damage.

This rewards players who interact skillfully with an incoming threat and turns defense into an opportunity for counterplay.

### Building Defeat Condition

The player character cannot die. Instead, the city acts as the main shared health condition. The player loses when the fifteenth building is destroyed.

This reinforces the fantasy of protecting the city and prevents the game from becoming focused entirely on personal survival.

## Design Process and Evidence

The design was developed through gameplay diagrams, system discussions, repeated Unity playtests, balancing checks, and revisions to unclear mechanics.

Potential supporting material:

- Early whiteboard and Miro diagrams.
- Core-loop diagram.
- Boss-phase flowchart.
- Energy and drone interaction diagram.
- HUD wireframes.
- Screenshots showing the visual progression from the earlier version to the night-time version.
- Gameplay footage of each boss phase.

## Challenges and Solutions

### Missiles Prevented Phase Progression

Missiles could be aimed toward an area without a collider, causing them to continue indefinitely and preventing the phase from ending.

A lifetime limit and cleanup state were introduced. Missiles now resolve after a maximum duration, release their rider, clean up their target, and allow the phase to continue.

### The Boss Drifted During Combat

Martin’s root object slowly changed position during longer gameplay sessions, which could disrupt the encounter.

The unused physical movement on the boss root was removed by making its Rigidbody kinematic. This kept Martin in the intended position without changing the active combat systems.

### Armor Did Not Reliably Protect the Boss

The boss could receive damage while the shield was active or allow the player to enter areas that should have been physically blocked.

Damage validation and physical collision were treated as separate problems. The health system now rejects damage during the shield state, while colliders prevent the player from entering Martin’s protected body.

### Important Information Was Difficult to Read

The original interface did not communicate energy, building damage, boss health, objectives, or drone controls clearly enough.

The HUD was reorganized around the information players need during decision-making: energy percentage, Martin’s health, destroyed buildings, overheat status, drone controls, and the current objective.

## My Impact

My design work helped transform the encounter from a straightforward boss fight into a multi-layered defense scenario. The player must now manage several interconnected responsibilities instead of continuously attacking the boss.

The building-loss condition strengthens the city-defense objective, the drone adds active resource management, and missile redirection connects defensive play with offensive progress.

## Final Result

The current version contains a complete multi-phase boss encounter with functional victory and defeat conditions, energy management, drone support, missile redirection, building destruction, gameplay feedback, and restart functionality.

The remaining production focus is interface and menu presentation, including the main menu, tutorial, settings, results screen, and final HUD polish.

## What I Learned

This project taught me that adding mechanics does not automatically create meaningful gameplay. The important part is defining how each mechanic affects the player’s priorities.

I also learned to treat edge cases as part of the design. A missile that never resolves, unclear armor feedback, or an objective that does not update can change how players understand the entire encounter.

## Play the Game

**Build / Download:** [To be added]
