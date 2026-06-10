FROM ghcr.io/enricoros/big-agi:latest

# Force the production server to bind to Hugging Face's expected port parameters
ENV PORT=7860
ENV HOST=0.0.0.0
ENV NODE_ENV=production

# Hugging Face runs containers using user ID 1000. 
# Ensure wide-open permissions for the internal Next.js server cache folders.
USER root
RUN mkdir -p /app/.next /app/public && chmod -R 777 /app
USER 1000

EXPOSE 7860

# Launch the engine directly
CMD ["node", "server.js"]
