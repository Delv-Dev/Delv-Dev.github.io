# Room For One More

## Project Overview

Room For One More is a cozy management and spatial-puzzle game about arranging furniture inside a room with limited space. The player responds to customer requests while balancing room capacity, furniture cost, and future placement needs.

**Genre:** Cozy Management / Spatial Puzzle
**Role:** Game Designer
**Engine:** Unity
**Development Time:** 7 days
**Team Size:** [To confirm]

## Gameplay Video

A short video showing customer requests, furniture purchases, placement, rotation, selling, and the completed room.

**Video:** [To be added]

## Personal Contributions — Game Designer

Created the initial concept for the “Limited Space” theme, inspired by the room customization in PewDiePie’s Tuber Simulator. Designed the initial core loop around a starting budget, requests from a grandmother character, and purchasing and arranging furniture within a limited room.

Collaborated with another game designer to develop the game flow, furniture database, and task requirements, including furniture prices, dimensions, stats, and task rewards. I also contributed ideas for several furniture items.

During team discussions, I proposed limiting furniture sales per round to preserve the challenge of limited space, and contributed to the tipping system as an additional source of income. Both systems were implemented. The game still requires further balancing between budget, task demands, and room capacity.

## Design Goal

The main goal was to create meaningful planning decisions from several simple constraints.

The player needed to satisfy current customer requests while considering whether each purchase and placement would make future requests more difficult.

## Core Gameplay Loop

**Receive Customer Request → Review Available Space and Budget → Buy Furniture → Place or Rotate Furniture → Satisfy the Request → Prepare for the Next Request**

As the room fills, earlier decisions affect the player’s future options.

## Key Systems

### Grid-Based Placement

Furniture is placed within a limited 9×9 room grid. Each object occupies space that may be needed later, making placement a long-term decision rather than a purely decorative choice.

### Furniture Rotation

Rotation gives the player additional ways to fit furniture into the available layout. It expands the solution space without removing the room’s spatial constraints.

### Customer Requests

Customer requests provide short-term objectives and introduce new furniture requirements. The player must decide how to satisfy each customer without damaging the room’s future usability.

### Economy

Furniture requires money, so the player cannot treat every placement problem as a purely spatial puzzle. The budget affects which solutions are available.

### Selling and Replacing Furniture

The ability to sell or replace furniture allows players to recover from earlier decisions, but changing the room may create a financial loss or disrupt an existing layout.

## Collaborative Design Documentation

Game flow, furniture values, and task requirements developed together with another game designer during the game jam. These notes document our initial design decisions rather than a fully balanced final system.

## Challenges and Solutions

### Balancing Current and Future Needs

If the player only needs to satisfy the current request, furniture placement may become too obvious.

Limited space and continued customer demands create a reason to consider future needs before committing to a layout.

### Preventing Irrecoverable Layouts

A player may place furniture in a way that blocks later progress.

Furniture rotation, selling, and replacement provide recovery options while retaining consequences for inefficient planning.

### Balancing Space and Money

If money is too generous, the economy becomes irrelevant. If space is too generous, placement loses its puzzle element.

Both resources must restrict different parts of the player’s decisions so that neither system becomes redundant.

## My Impact

My initial concept and collaborative design work helped connect customer requests, room space, and budget into one decision-making system. The game still requires further balancing between budget, task demands, and room capacity.

Rather than treating furniture placement as decoration, the design encourages players to evaluate each object based on immediate usefulness, cost, occupied space, and its effect on future requests.

## Final Result

Room For One More became a cozy management puzzle where simple placement actions create longer-term planning decisions.

The completed experience allows players to buy, place, rotate, sell, and replace furniture while responding to customer demands inside a limited room.

## What I Learned

This project taught me that constraints can create depth without requiring complicated controls. Space, money, and customer demand are individually simple, but their interaction creates meaningful planning.

I also learned that players need ways to recover from mistakes. Selling and replacing furniture preserve the consequences of earlier decisions without making one poor placement permanently ruin the experience.

## Play the Game

[Play Room For One More on itch.io](https://maximillian520.itch.io/room-for-one-more)
